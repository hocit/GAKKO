export type Project = {
    watcher: string;
    watch: string;
    relative_path: string | null;
    version: string;
};

export type SubscriptionReportFileType = "f" | "d";

export type SubscriptionReportFile = {
    name: string;
    size: number;
    mtime_ms: number;
    exists: boolean;
    type: SubscriptionReportFileType;
};

export type SubscriptionReport = {
    unilateral: boolean;
    subscription: string;
    root: string;
    files: SubscriptionReportFile[];
    version: string;
    since: string;
    clock: string;
    is_fresh_instance: boolean;
};
