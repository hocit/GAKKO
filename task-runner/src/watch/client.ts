import watchman from "fb-watchman";
import { Project as WatchProject, SubscriptionReport } from "../types/Watchman";

export default class ClientDetail {
    private _key: string;
    private _client: watchman.Client;
    private _rootDir = "";
    private _project: WatchProject | null = null;
    private _index = 0;

    public constructor(key: string) {
        this._key = key;
        this._client = new watchman.Client();
    }

    get key(): string {
        return this._key;
    }
    get client(): watchman.Client {
        return this._client;
    }
    get rootDir(): string {
        return this._rootDir;
    }
    get project(): WatchProject | null {
        return this._project;
    }

    public async init(dirname: string): Promise<void> {
        this._rootDir = dirname;

        try {
            const resp = await new Promise((resolve, reject) => {
                this.client.capabilityCheck(
                    { optional: [], required: ["relative_root"] },
                    (error, resp) => {
                        if (error) {
                            return reject(error);
                        }

                        resolve(resp);
                    }
                );
            });

            console.log(resp);
        } catch (error) {
            console.error(error);
            this.client.end();
            return;
        }

        console.log(dirname);
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const resp = await new Promise<any>((resolve, reject) => {
            this.client.command(["watch-project", dirname], (error, resp) => {
                if (error) {
                    return reject(error);
                }

                if ("warning" in resp) {
                    console.log("warning:", resp.warning);
                }

                console.log(resp);

                console.log(
                    "watch established on",
                    resp.watch,
                    "relative_path",
                    resp.relative_path
                );
                resolve(resp);
            });
        }).catch((error) => {
            console.error("Error initiating watch:", error);
        });

        if (!resp) {
            return;
        }
        this._project = resp;
    }

    public getSubscribeKey(index: number | null = null): string {
        if (index === null) {
            index = this._index;
            this._index += 1;
        }

        return `${this._key}_${index}`;
    }

    public getAnalyzeKey(key: string): number {
        let match;
        const exp = new RegExp(`^${this._key}_([0-9]+?)$`);
        if ((match = key.match(exp))) {
            return parseInt(match[1]);
        }

        return -1;
    }

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    public async subscribe(key: string, sub: any): Promise<any> {
        return new Promise((resolve, reject) => {
            if (!this.project) {
                return reject("Not inited");
            }

            this.client.command(
                ["subscribe", this.project.watch, key, sub],
                (error, resp) => {
                    if (error) {
                        return reject(`Failed to subscribe: ${error}`);
                    }

                    console.log(`subscription ${resp.subscribe} established`);
                    resolve(resp);
                }
            );
        });
    }

    public subscription(callback: (resp: SubscriptionReport) => void): void {
        this.client.on("subscription", callback);
    }
}
