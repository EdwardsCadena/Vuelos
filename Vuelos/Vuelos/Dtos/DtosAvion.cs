namespace Vuelos.Dtos
{
    public class DtosAvion
    {
        public int IdAvion { get; set; }

        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Motor { get; set; }
        public bool? Estado { get; set; }
        public DateTime? FechaCompra { get; set; }
        public DateTime? FechaSalida { get; set; }
    }
}
