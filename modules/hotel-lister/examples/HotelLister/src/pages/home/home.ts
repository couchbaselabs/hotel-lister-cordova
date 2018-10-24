import { Component } from '@angular/core';
import { Platform } from 'ionic-angular';
declare var window: any;

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
  hotels: any[];

  constructor(public platform: Platform) {
    // tag::query-hotels[]
    this.platform.ready().then(() => {
      window.plugins.HotelLister.queryHotels((hotels) => {
        console.log(hotels);
        this.hotels = hotels;
      });
    });
    // end::query-hotels[]
  }

}
