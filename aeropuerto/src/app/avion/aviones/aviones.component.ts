import { Component, OnInit } from '@angular/core';
import { Avion } from 'src/app/models/avion';
import { AvionService } from 'src/app/services/avion.service';

@Component({
  selector: 'app-aviones',
  templateUrl: './aviones.component.html',
  styleUrls: ['./aviones.component.css'],
})
export class AvionesComponent implements OnInit {
  aviones: Avion[] = [];

  constructor(private _servicePlane: AvionService) {}

  ngOnInit() {
    this._servicePlane.getPlanes().subscribe({
      next: (response) => {
        this.aviones = response;
      },
      error: (error) => {
        alert('Hubo un error trayendo la información del servidor ' + error);
      },
    });
  }

  eliminarAvion(i: number) {
    this._servicePlane.deletePlane(i);
  }
}
