import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Avion } from 'src/app/models/avion';
import { AvionService } from 'src/app/services/avion.service';

@Component({
  selector: 'app-add-edit-avion',
  templateUrl: './add-edit-avion.component.html',
  styleUrls: ['./add-edit-avion.component.css'],
})
export class AddEditAvionComponent implements OnInit {
  planeForm!: FormGroup;

  idAvion = 0;
  accion = 'Agregar';

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private _serviceAvion: AvionService,
    private route: ActivatedRoute
  ) {
    this.planeForm = this.fb.group({
      name: [null, Validators.required],
      description: [null, Validators.required],
      motor: [null, Validators.required],
      state: [false, Validators.required],
      fechaRegistro: [null, Validators.required],
      fechaCompra: [null, Validators.required],
      fechaSalida: [null, Validators.required],
    });
    this.route.params.subscribe((params) => {
      this.idAvion = params['id'];
    });
  }

  ngOnInit(): void {
    if (this.idAvion > 0 && this.idAvion != undefined) {
      this.accion = 'Modificar';
      this.cargarAvion();
    }
  }

  cargarAvion() {
    const AVION: Avion = this._serviceAvion.getPlane(this.idAvion);

    console.log(`Se carga: ${JSON.stringify(AVION)}`);

    this.planeForm.setValue({
      name: AVION.Nombre,
      description: AVION.Descripcion,
      motor: AVION.Motor,
      state: AVION.Estado,
      fechaRegistro: AVION.FechaRegistro,
      fechaCompra: AVION.FechaCompra,
      fechaSalida: AVION.FechaSalida
    });

    console.log(`${JSON.stringify(this.planeForm.value)}`);
  }

  onSubmit(form: FormGroup) {
    console.log(`${JSON.stringify(this.planeForm.value)}`);

    const AVION: Avion = {
      Nombre: form.value.name,
      Descripcion: form.value.description,
      Motor: form.value.motor,
      Estado: form.value.state,
      FechaRegistro: form.value.fechaRegistro,
      FechaCompra: form.value.fechaCompra,
      FechaSalida: form.value.fechaSalida,
    };

    if (this.idAvion != 0 && this.idAvion != undefined) {
      this._serviceAvion.updatePlane(AVION, this.idAvion);
    } else {
      this._serviceAvion.postPlane(AVION);
    }

    this.router.navigate(['/aviones']);
  }
}
