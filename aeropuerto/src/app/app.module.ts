import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AvionesComponent } from './avion/aviones/aviones.component';
import { AddEditAvionComponent } from './avion/addeditavion/add-edit-avion.component';
import { ItinerarioComponent } from './itinerario/itinerario/itinerario.component';
import { AddEditItinerarioComponent } from './itinerario/add-edit-itinerario/add-edit-itinerario.component';
import { LugaresComponent } from './estadisticas/lugares/lugares.component';
import { ViajesComponent } from './estadisticas/viajes/viajes.component';
import { NavbarComponent } from './navbar/navbar.component';

@NgModule({
  declarations: [
    AppComponent,
    AddEditAvionComponent,
    AvionesComponent,
    ItinerarioComponent,
    AddEditItinerarioComponent,
    LugaresComponent,
    ViajesComponent,
    NavbarComponent,
  ],
  imports: [
    BrowserModule, 
    AppRoutingModule,
    BrowserAnimationsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
