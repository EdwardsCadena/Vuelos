import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Itinerario } from 'src/app/models/itinerario';
import { ItinerarioService } from 'src/app/services/itinerario.service';

@Component({
  selector: 'app-add-edit-itinerario',
  templateUrl: './add-edit-itinerario.component.html',
  styleUrls: ['./add-edit-itinerario.component.css']
})
export class AddEditItinerarioComponent implements OnInit {
  itinerarioForm!: FormGroup;

  idVuelos = 0;
  accion = 'Agregar';

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private _serviceItinerario: ItinerarioService,
    private route: ActivatedRoute 
  ) {
    this.itinerarioForm = this.fb.group({
      nombreVuelo: [null, Validators.required],
      descripcion: [null, Validators.required],
      idAvion: [null, Validators.required],
      idCiudad: [false, Validators.required],
      idDestino: [null, Validators.required],
      fechaRegistro: [null, Validators.required],
      fechaSalida: [null, Validators.required],
      fechaLlegada: [null, Validators.required],
    });
    this.route.params.subscribe((params) => {
      this.idVuelos = params['id'];
    });
  }

  ngOnInit(): void {
    if (this.idVuelos > 0 && this.idVuelos != undefined) {
      this.accion = 'Modificar';
      this.cargarItinerario();
    }
  }

  cargarItinerario() {
    const ITINERARIO: Itinerario = this._serviceItinerario.getItinerario(this.idVuelos);

    console.log(`Se carga: ${JSON.stringify(ITINERARIO)}`);

    this.itinerarioForm.setValue({
      nombreVuelo: ITINERARIO.NombreVuelo,
      descripcion: ITINERARIO.Descripcion,
      idAvion: ITINERARIO.IdAvion,
      idCiudad: ITINERARIO.IdCiudad,
      idDestino: ITINERARIO.IdDestino,
      fechaRegistro: ITINERARIO.FechaRegistro,
      fechaSalida: ITINERARIO.FechaSalida,
      fechaLlegada: ITINERARIO.FechaLlegada
    });

    console.log(`${JSON.stringify(this.itinerarioForm.value)}`);
  }

  onSubmit(form: FormGroup) {
    console.log(`${JSON.stringify(this.itinerarioForm.value)}`);



    // if (this.idVuelos != 0 && this.idVuelos != undefined) {
    //   this._serviceItinerario.updateItinerario(ITINERARIO, this.idVuelos);
    // } else {
    //   this._serviceItinerario.postItinerario(ITINERARIO);
    // }

    this.router.navigate(['/itinerario']);
  }
}