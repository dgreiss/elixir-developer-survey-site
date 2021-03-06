import Chart from 'chart.js';

let Hooks = {}
Hooks.BarChart = {
  getCanvasContext() {
    return this.el.getContext('2d');
  },
  getData() {
    return JSON.parse(this.el.dataset.chart);
  },
  calculateBarThickness(data) {
    return data.length > 8 ? 20 : 40
  },
  renderChart(ctx, data) {
    new Chart(ctx, {
      type: 'horizontalBar',
      data: {
        labels: data.labels,
        datasets: [{
          data: data.prop,
          backgroundColor: [
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
          ],
          barThickness: this.calculateBarThickness(data.labels)
        }]
      },
      options: {
        aspectRatio: 2,
        legend: false,
        tooltips: {
          callbacks: {
            label: function (tooltipItem, data) {
              return tooltipItem.value + '%';
            }
          }
        },
        scales: {
          xAxes: [{
            ticks: {
              beginAtZero: true,
              callback: function (value, index, values) {
                return value + '%';
              }
            },
          }],
        },
      }
    })
  },
  mounted() { this.renderChart(this.getCanvasContext(), this.getData()) },
  updated() { this.renderChart(this.getCanvasContext(), this.getData()) }
}

export { Hooks };