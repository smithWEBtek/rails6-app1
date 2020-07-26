import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';

document.addEventListener('DOMContentLoaded', function () {
  let calendarEl = document.getElementById('calendar');

  let calendar = new Calendar(calendarEl, {
    plugins: [interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin],
    headerToolbar: {
      left: 'prev,next title',
      center: '',
      right: 'today,dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    titleFormat: {
      year: 'numeric', month: 'long', day: 'numeric'
    },
    dateClick: function (info) {
      console.log('dateClick: ' + info.dateStr);
      console.log('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
      console.log('Current view: ' + info.view.type);
      // change the day's background color just for fun
      info.dayEl.style.backgroundColor = 'lightblue';
    },
    eventClick: function (eventClickInfo) {
      console.log("EVENT: ", eventClickInfo)
    },
    select: function (info) {
      console.log('info.startStr: ' + info.startStr + ' to ' + info.endStr);
      console.log('info: ', info);
    },
    initialView: 'dayGridMonth',
    selectable: true,
    editable: true,
    eventStartEditable: true,
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    events: [
      {
        title: 'All Day Event',
        start: '2020-07-01',
      },
      {
        title: 'Long Event',
        start: '2020-07-07',
        end: '2020-07-10'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2020-07-09T16:00:00'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2020-07-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2020-07-11',
        end: '2020-07-13'
      },
      {
        title: 'Meeting',
        start: '2020-07-12T10:30:00',
        end: '2020-07-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2020-07-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2020-07-12T14:30:00'
      },
      {
        title: 'Happy Hour',
        start: '2020-07-12T17:30:00'
      },
      {
        title: 'Dinner',
        start: '2020-07-12T20:00:00'
      },
      {
        title: 'Birthday Party',
        start: '2020-07-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2020-07-28'
      }
    ]
  });

  calendar.render();
});
