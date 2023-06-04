type ValidationState<T> = {
    [key in keyof T]: boolean;
};
