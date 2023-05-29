export interface PagedResponse<T> {
    items: T[],
    pageSize: number,
    currentPage: number,
    totalRecords: number,
    totalPages: number
}