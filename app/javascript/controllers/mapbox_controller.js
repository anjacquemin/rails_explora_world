import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    maxZoom: Number
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      if (marker.guide == true) {
        customMarker.style.backgroundSize = "contain"
        customMarker.style.borderRadius = "50%"
        customMarker.style.backgroundRepeat = "no-repeat"
        customMarker.style.width = "35px"
        customMarker.style.height = "35px"
      }
      else {
        customMarker.style.marginTop = '-27px'
        customMarker.style.backgroundSize = "cover"
        customMarker.style.width = "50px"
        customMarker.style.height = "50px"
      }
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: this.maxZoomValue, duration: 0 })
  }

}
