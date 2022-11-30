namespace Vuelos.Models
{
    public class Avion

    {
        public int IdAvion { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Motor { get; set; }
        public bool? Estado { get; set; }
        public DateTime? FechaRegistro { get; set; }
        public DateTime? FechaCompra { get; set; }
        public DateTime? FechaSalida { get; set; }
    }
}

