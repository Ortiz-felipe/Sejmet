type ValidationState<T> = {
  [K in keyof T]?: T[K] extends Array<infer U>
    ? U extends object
      ? ValidationState<U>[]
      : boolean
    : T[K] extends object
    ? ValidationState<T[K]>
    : boolean
}
