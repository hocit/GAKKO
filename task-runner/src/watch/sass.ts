import WatchClient from "./client";
import { resolve, sep } from "path";
import SassTask from "../sass";

(async (): Promise<void> => {
    const client = new WatchClient("sass");
    await client.init(
        resolve(`${process.cwd()}/${process.env.npm_package_config_base}`)
    );

    if (!client.project) {
        return;
    }

    const targets = (process.env.npm_package_config_sass || "").split(",");
    if (!targets.length) {
        return;
    }
    console.log(targets);

    // Prepare Task
    const task = new SassTask(client.rootDir);

    await Promise.all(
        targets.map(async (relative_root, index) => {
            if (!client.project) {
                return;
            }

            if (!client.project.relative_path) {
                relative_root = relative_root.split(sep).slice(1).join(sep);
                targets[index] = relative_root;
            }
            console.log(relative_root);

            const sub = {
                expression: ["allof", ["match", "*.scss"]],
                fields: ["name", "size", "mtime_ms", "exists", "type"],
                relative_root,
            };
            await client.subscribe(client.getSubscribeKey(index), sub);
        })
    );

    client.subscription((resp) => {
        const index = client.getAnalyzeKey(resp.subscription);
        if (index < 0) {
            return;
        }

        if (!resp.files.length) {
            return;
        }

        const file = resp.files[0];
        const filePath = `${resp.root}/${targets[index]}/${file.name}`;
        console.log(
            "============================================================"
        );
        if (file.exists) {
            if (!file.size) {
                console.log("file added or empty: " + filePath);
            } else {
                console.log("file changed: " + filePath);
                task.buildOne(filePath);
            }
        } else {
            console.log("file deleted: " + filePath);
        }
    });
})();
