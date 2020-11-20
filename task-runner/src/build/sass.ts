import { resolve } from "path";
import SassTask from "../sass";

(async (): Promise<void> => {
    const targets = (process.env.npm_package_config_sass || "").split(",");
    if (!targets.length) {
        return;
    }

    // Prepare Task
    const task = new SassTask(
        resolve(`${process.cwd()}/${process.env.npm_package_config_base}`)
    );

    await Promise.all(
        targets.map(async (target) => {
            const filePath = resolve(`${process.cwd()}/${target}/**/*.scss`);
            task.buildAll(filePath);
        })
    );
})();
