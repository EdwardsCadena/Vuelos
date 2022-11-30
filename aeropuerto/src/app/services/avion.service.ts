import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Avion } from '../models/avion';

@Injectable({
  providedIn: 'root'
})
export class AvionService {

  planes: Avion[] = [
    {
      IdAvion: 1,
      Nombre: 'Airbus',
      Descripcion: 'a',
      Motor: 'Nice',
      Estado: true,
      FechaCompra: Date.now().toString(),
      FechaRegistro: Date.now().toString(),
      FechaSalida: Date.now().toString()
    },
    {
      IdAvion: 2,
      Nombre: 'Airbus',
      Descripcion: 'a',
      Motor: 'Nice',
      Estado: true,
      FechaCompra: Date.now().toString(),
      FechaRegistro: Date.now().toString(),
      FechaSalida: Date.now().toString()
    },
    {
      IdAvion: 3,
      Nombre: 'Airbus',
      Descripcion: 'a',
      Motor: 'Nice',
      Estado: true,
      FechaCompra: Date.now().toString(),
      FechaRegistro: Date.now().toString(),
      FechaSalida: Date.now().toString()
    }
  ];

  planes$: Observable<Avion[]> = of(this.planes);

  constructor() { }
  
  getPlanes(){
    return this.planes$;
  }

  getPlane(index: number){
    return this.planes[index - 1];
  }

  postPlane(plane : Avion){
    plane.IdAvion = this.planes.length + 1
    this.planes.push(plane)
  }

  updatePlane(plane: Avion, index: number){
    index = index - 1;
    this.planes[index].Nombre = plane.Nombre;
    this.planes[index].Descripcion = plane.Descripcion;
    this.planes[index].Motor = plane.Motor;
    this.planes[index].Estado = plane.Estado;
    this.planes[index].FechaRegistro = plane.FechaRegistro;
    this.planes[index].FechaCompra = plane.FechaCompra;
    this.planes[index].FechaSalida = plane.FechaSalida;
  }

  deletePlane(index: number){
    this.planes.splice(index, 1)
  }
}
