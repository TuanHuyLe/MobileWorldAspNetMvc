
namespace Model.Models
{
    public interface Specifications
    {
        int id { get; set; }

        string cpu { get; set; }

        string ram { get; set; }

        string screen { get; set; }

        string os { get; set; }
    }
}
