import { Avion } from "./avion";
import { Ciudad } from "./ciudad";

export interface Itinerario {
    IdVuelos: number;
    NombreVuelo: string;
    Descripcion: string;
    IdAvion: Avion;
    IdCiudad: Ciudad;
    IdDestino: Ciudad;
    FechaRegistro: string;
    FechaSalida: string;
    FechaLlegada: string;
}


