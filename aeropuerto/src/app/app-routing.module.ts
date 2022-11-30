import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AvionesComponent } from './avion/aviones/aviones.component';
import { AddEditAvionComponent } from './avion/addeditavion/add-edit-avion.component';
import { ItinerarioComponent } from './itinerario/itinerario/itinerario.component';
import { AddEditItinerarioComponent } from './itinerario/add-edit-itinerario/add-edit-itinerario.component';
import { ViajesComponent } from './estadisticas/viajes/viajes.component';
import { LugaresComponent } from './estadisticas/lugares/lugares.component';
import { NavbarComponent } from './navbar/navbar.component';

const routes: Routes = [
  { path: '', component: NavbarComponent },
  { path: 'aviones', component: AvionesComponent },
  { path: 'aviones/add', component: AddEditAvionComponent },
  { path: 'aviones/edit/:id', component: AddEditAvionComponent },
  { path: 'itinerario', component: ItinerarioComponent },
  { path: 'itinerario/add', component: AddEditItinerarioComponent },
  { path: 'itinerario/edit/:id', component: AddEditItinerarioComponent },
  { path: 'viajes', component: ViajesComponent },
  { path: 'lugares', component: LugaresComponent },
  { path: '**', redirectTo: '' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
