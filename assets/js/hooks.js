import Chart from 'chart.js';

let Hooks = {}
Hooks.Chart = {
  mounted() {
    var ctx = this.el.getContext('2d');
    var data = this.el.dataset.chart;
    data = JSON.parse(data);
    new Chart(ctx, {
      type: 'horizontalBar',
      data: {
        labels: data.labels,
        datasets: [{
          data: data.data,
          backgroundColor: [
            '#3730A3',
            '#3730A3',
            '#3730A3',
            '#3730A3',
          ],
          barThickness: 40
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
    });
  }
}

export {
  Hooks
};