namespace GIS_Technolory.Response
{
    public class Response<T>
    {
        public bool Success { get; set; }

        /// <summary>Gets or sets the messages.</summary>
        /// <value>The messages.</value>
        public string Message { get; set; }

        /// <summary>Gets or sets the data.</summary>
        /// <value>The data.</value>
        public T Data { get; set; }
    }
}
