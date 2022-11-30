import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Ciudad } from '../models/ciudad';

@Injectable({
  providedIn: 'root'
})
export class CiudadService {

  ciudades: Ciudad[] = [
    { IdCiudad: 1, NombreCiudad: 'Bogotá', Aeropuerto: 'El Dorado', Estado: false },
    { IdCiudad: 2, NombreCiudad: 'Medellín', Aeropuerto: 'Jose Maria Cordova', Estado: true },
    { IdCiudad: 3, NombreCiudad: 'Cali', Aeropuerto: 'Alfonso Bonilla Aragon', Estado: true },
    { IdCiudad: 4, NombreCiudad: 'Barranquilla', Aeropuerto: 'Ernesto Cortissoz', Estado: true },
    { IdCiudad: 5, NombreCiudad: 'Cartagena', Aeropuerto: 'Rafael Nunez', Estado: true },
    { IdCiudad: 6, NombreCiudad: 'Bucaramanga', Aeropuerto: 'Palonegro', Estado: true },
    { IdCiudad: 7, NombreCiudad: 'Cúcuta', Aeropuerto: 'Camilo Daza', Estado: true },
    { IdCiudad: 8, NombreCiudad: 'Ibagué', Aeropuerto: 'Perales', Estado: true },
    { IdCiudad: 9, NombreCiudad: 'Pereira', Aeropuerto: 'Matecaña', Estado: true },
    { IdCiudad: 10, NombreCiudad: 'Santa Marta', Aeropuerto: 'Simon Bolivar', Estado: true },
    { IdCiudad: 11, NombreCiudad: 'Manizales', Aeropuerto: 'La Nubia', Estado: true },
    { IdCiudad: 12, NombreCiudad: 'Villavicencio', Aeropuerto: 'La Vanguardia', Estado: true },
    { IdCiudad: 13, NombreCiudad: 'Pasto', Aeropuerto: 'Alferez FAP David Figueroa Fernandini', Estado: true },
    { IdCiudad: 14, NombreCiudad: 'Neiva', Aeropuerto: 'Benito Sal 3', Estado: true },
    { IdCiudad: 18, NombreCiudad: 'Montería', Aeropuerto: 'Antonio Roldan Betancourt', Estado: true },
    { IdCiudad: 19, NombreCiudad: 'Tunja', Aeropuerto: 'Gustavo Rojas Pinilla', Estado: true },
    { IdCiudad: 19, NombreCiudad: 'San Andres y Providencia', Aeropuerto: 'Gustavo Rojas Pinilla', Estado: true },
  ];

  ciudades$: Observable<Ciudad[]> = of(this.ciudades);

  constructor() { }

  getCiudades() {
    return this.ciudades$;
  }
}
