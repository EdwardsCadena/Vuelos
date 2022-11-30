import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Itinerario } from '../models/itinerario';

@Injectable({
  providedIn: 'root'
})
export class ItinerarioService {

  itinerarios: Itinerario[] = [
    {
      IdVuelos: 1,
      NombreVuelo: 'Cartagena-Bogota',
      Descripcion: 'Una escala',
      IdAvion: {
        IdAvion: 4,
        Nombre: 'Boeing 747'
      },
      IdCiudad: {
        IdCiudad: 5, NombreCiudad: 'Cartagena'
      },
      IdDestino: {
        IdCiudad: 1, NombreCiudad: 'Bogota'
      },
      FechaRegistro: Date.now().toString(),
      FechaSalida: Date.now().toString(),
      FechaLlegada: Date.now().toString()
    },
    {
      IdVuelos: 2,
      NombreVuelo: 'Bogotá-Cartagena',
      Descripcion: 'Una escala',
      IdAvion: {
        IdAvion: 4,
        Nombre: 'Boeing 747'
      },
      IdCiudad: {
        IdCiudad: 5, NombreCiudad: 'Cartagena'
      },
      IdDestino: {
        IdCiudad: 1, NombreCiudad: 'Bogota'
      },
      FechaRegistro: Date.now().toString(),
      FechaSalida: Date.now().toString(),
      FechaLlegada: Date.now().toString()
    },
    {
      IdVuelos: 3,
      NombreVuelo: 'Bogotá-Cali',
      Descripcion: 'Una escala',
      IdAvion: {
        IdAvion: 6,
        Nombre: 'Airbus A320'
      },
      IdCiudad: {
        IdCiudad: 5, NombreCiudad: 'Cartagena'
      },
      IdDestino: {
        IdCiudad: 1, NombreCiudad: 'Bogota'
      },
      FechaRegistro: Date.now().toString(),
      FechaSalida: Date.now().toString(),
      FechaLlegada: Date.now().toString()
    }
  ];

  itinerarios$: Observable<Itinerario[]> = of(this.itinerarios);

  constructor() { }

  getItinerarios(){
    return this.itinerarios$;
  }

  getItinerario(index: number){
    return this.itinerarios[index - 1];
  }

  postItinerario(itinerario : Itinerario){
    itinerario.IdVuelos = this.itinerarios.length + 1
    this.itinerarios.push(itinerario)
  }

  updateItinerario(itinerario: Itinerario, index: number){
    this.itinerarios[index - 1] = itinerario;
  }

  deleteItinerario(index: number){
    this.itinerarios.splice(index - 1, 1);
  }
}
