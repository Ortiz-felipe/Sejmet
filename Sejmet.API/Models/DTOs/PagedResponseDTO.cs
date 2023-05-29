namespace Sejmet.API.Models.DTOs
{
    public class PagedResponseDTO<T>
    {
        public IList<T> Items { get; set; }
        public int PageSize { get; set; }
        public int CurrentPage { get; set; }
        public int TotalRecords { get; set; }
        public int TotalPages { get; set; }
    }
}
