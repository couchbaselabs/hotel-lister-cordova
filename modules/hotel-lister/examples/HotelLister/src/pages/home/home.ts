import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
declare var window: any;

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  hotels: any[];

  constructor(public navCtrl: NavController) {

    // tag::query-hotels[]
    window.plugins.HotelLister.queryHotels((hotels) => {
      console.log(hotels);
      this.hotels = hotels;
    });
    // end::query-hotels[]

  }

}
