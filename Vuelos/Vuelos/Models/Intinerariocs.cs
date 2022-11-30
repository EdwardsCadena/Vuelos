namespace Vuelos.Models
{
    public class Intinerariocs
    {
        public int IdViaje { get; set; }
        public string NombreVuelo { get; set; }
        public string Descripcion { get; set; }
        public int IdAvion { get; set; }
        public int IdCiudad { get; set; }
        public int IdDestino { get; set; }
        public DateTime? FechaRegistro { get; set; }
        public DateTime? FechaSalida{ get; set; }
        public DateTime? FechaLlegada{ get; set; }
    }
}
