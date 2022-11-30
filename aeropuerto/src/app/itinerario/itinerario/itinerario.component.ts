import { Component, OnInit } from '@angular/core';
import { Itinerario } from 'src/app/models/itinerario';
import { ItinerarioService } from 'src/app/services/itinerario.service';

@Component({
  selector: 'app-itinerario',
  templateUrl: './itinerario.component.html',
  styleUrls: ['./itinerario.component.css'],
})
export class ItinerarioComponent implements OnInit {
  itinerarios: Itinerario[] = [];

  constructor(private _serviceItinerate: ItinerarioService) {}

  ngOnInit() {
    this._serviceItinerate.getItinerarios().subscribe({
      next: (response) => {
        this.itinerarios = response;
      },
      error: (error) => {
        alert('Hubo un error trayendo la información del servidor ' + error);
      },
    });
  }

  eliminarItinerario(i: number) {
    this._serviceItinerate.deleteItinerario(i);
  }
}
