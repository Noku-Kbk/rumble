import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxDirections from "@mapbox/mapbox-gl-directions"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    startLng: Number,
    startLat: Number,
    endLng: Number,
    endLat: Number
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/satellite-v9",
      center: [this.startLngValue, this.startLatValue],
      zoom: 12
    })

    this.directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      unit: 'metric',
      profile: 'mapbox/driving-traffic', // Use traffic-aware routing
      controls: {
        inputs: true,
        instructions: false, // Hide instructions by default
        profileSwitcher: true // Enable different routing profiles
      },
      styles: [
        {
          'id': 'directions-route-line',
          'type': 'line',
          'source': 'directions',
          'layout': {
            'line-cap': 'round',
            'line-join': 'round'
          },
          'paint': {
            'line-color': '#3887be',
            'line-width': 5,
            'line-opacity': 0.75
          }
        }
      ],
      alternatives: true, // Show alternative routes
    })


    this.map.addControl(this.directions)
    this.map.addControl(new mapboxgl.NavigationControl())

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    if (this.startLngValue && this.startLatValue && this.endLngValue && this.endLatValue) {
      this.directions.setOrigin([this.startLngValue, this.startLatValue])
      this.directions.setDestination([this.endLngValue, this.endLatValue])
    }


    this.map.on('load', () => {
      this.map.addSource('potholes', {
        type: 'geojson',
        data: { type: 'FeatureCollection', features: this.markersValue },
        cluster: true,
        clusterMaxZoom: 14,
        clusterRadius: 50
      })

      // Add cluster layers for different zoom levels
      this.map.addLayer({
        id: 'clusters',
        type: 'circle',
        source: 'potholes',
        filter: ['has', 'point_count'],
        paint: {
          'circle-color': [
            'step',
            ['get', 'point_count'],
            '#51bbd6', 100, '#f1f075', 750, '#f28cb1'
          ],
          'circle-radius': [
            'step',
            ['get', 'point_count'], 20, 100, 30, 750, 40
          ]
        }
      })
    })

    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: { enableHighAccuracy: true },
        trackUserLocation: true
      })
    )

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    if (this.markersValue.length > 0) {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
  }
}
