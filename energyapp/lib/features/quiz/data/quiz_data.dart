// lib/features/quiz/data/quiz_data.dart
import '../models/question.dart';

/// Map<CategoryName, List<Question>>
final Map<String, List<Question>> quizData = {
  'Safety': [
    Question(
      question: 'During a blackout in Mauritius, what should you do first?',
      options: [
        'Unplug sensitive appliances',
        'Stand near electric poles',
        'Open the fridge repeatedly',
        'Walk outside with candles',
      ],
      correctIndex: 0,
      explanation:
          'Unplug appliances like TVs and computers because power restoration may cause voltage spikes.',
    ),
    Question(
      question: 'Is it safe to approach a fallen CEB electricity cable?',
      options: [
        'Yes, if it is not sparking',
        'Yes, during the day',
        'No, stay away and call the CEB hotline',
        'Yes, if you are wearing slippers',
      ],
      correctIndex: 2,
      explanation:
          'Fallen power lines may still be live. Always call CEB on 130.',
    ),
    Question(
      question: 'What should you avoid using inside the house during strong winds?',
      options: [
        'Torches',
        'Battery lamps',
        'Kerosene lamps',
        'Solar lanterns',
      ],
      correctIndex: 2,
      explanation:
          'Kerosene lamps pose a fire hazard during windy weather or cyclones.',
    ),
    Question(
      question: 'When experiencing electrical shocks from appliances, what should you do?',
      options: [
        'Ignore it and continue using the appliance',
        'Use it only when barefoot',
        'Stop using it and call a licensed electrician',
        'Wrap it in a cloth',
      ],
      correctIndex: 2,
      explanation:
          'Electrical shocks indicate a grounding or insulation fault. Only a licensed electrician should fix it.',
    ),
    Question(
      question: 'What is the safest way to handle water near power sockets?',
      options: [
        'Wipe the area and continue as normal',
        'Avoid contact and switch off the main breaker',
        'Use a hairdryer to evaporate water',
        'Throw salt to “absorb” electricity',
      ],
      correctIndex: 1,
      explanation: 'Water conducts electricity. Switch off the main breaker immediately.',
    ),
    Question(
      question: 'What should you do before using a generator at home?',
      options: [
        'Connect it directly into the house mains',
        'Place it indoors',
        'Ensure proper ventilation outdoors',
        'Fill fuel while it is running',
      ],
      correctIndex: 2,
      explanation:
          'Generators release carbon monoxide. They must be used outdoors with ventilation.',
    ),
    Question(
      question: 'During heavy flooding in Mauritius, what must you avoid?',
      options: [
        'Walking through flood water',
        'Listening to the radio',
        'Storing emergency water',
        'Turning off appliances',
      ],
      correctIndex: 0,
      explanation:
          'Flood water may hide open drains, sharp objects or electrified areas.',
    ),
    Question(
      question: 'Why should damaged extension cords not be used?',
      options: [
        'They look ugly',
        'They may cause electrocution or fire',
        'They make appliances slower',
        'They reduce voltage',
      ],
      correctIndex: 1,
      explanation:
          'Damaged wiring increases the risk of fires and electrical shocks.',
    ),
    Question(
      question: 'What should you do if your home smells like burning plastic?',
      options: [
        'Spray air freshener',
        'Look for the source and unplug appliances',
        'Ignore—it will go away',
        'Open the fridge for cooling',
      ],
      correctIndex: 1,
      explanation: 'Burning smells often indicate wiring overheating.',
    ),
    Question(
      question: 'What must be done when using ladders near power lines?',
      options: [
        'Use metal ladders',
        'Keep as far as possible from lines',
        'Climb during rain',
        'Touch the line to check for power',
      ],
      correctIndex: 1,
      explanation:
          'Stay far from overhead lines to prevent electrocution.',
    ),
  ],

  // ------------------------------------------------------------------

  'Energy': [
    Question(
      question: 'Which home appliance typically uses the most electricity in Mauritius?',
      options: [
        'Phone charger',
        'LED bulb',
        'Air conditioner',
        'Laptop',
      ],
      correctIndex: 2,
      explanation:
          'Air conditioners consume significant power, especially during summer.',
    ),
    Question(
      question: 'What is an efficient habit when using your geyser?',
      options: [
        'Turn it on only when needed',
        'Leave it on the whole day',
        'Keep it on during a blackout',
        'Use it at peak hours',
      ],
      correctIndex: 0,
      explanation:
          'Turning on the geyser only when needed reduces energy waste.',
    ),
    Question(
      question: 'Why are LED bulbs recommended in Mauritian households?',
      options: [
        'They produce more heat',
        'They consume far less electricity',
        'They spoil food',
        'They attract more insects',
      ],
      correctIndex: 1,
      explanation: 'LED bulbs save up to 80% energy compared to CFL or incandescent bulbs.',
    ),
    Question(
      question: 'Which of the following reduces your CEB bill?',
      options: [
        'Using old appliances',
        'Turning off lights in unused rooms',
        'Leaving chargers plugged in',
        'Running AC with windows open',
      ],
      correctIndex: 1,
      explanation:
          'Switching off unused lights reduces wasted electricity.',
    ),
    Question(
      question: 'What is an advantage of solar water heaters in Mauritius?',
      options: [
        'They need electricity to work',
        'They reduce electricity usage significantly',
        'They heat water slower',
        'They only work at night',
      ],
      correctIndex: 1,
      explanation:
          'Mauritius has strong sunlight, making solar heaters very efficient.',
    ),
    Question(
      question: 'What is the best way to use your fridge efficiently?',
      options: [
        'Keep the door open frequently',
        'Overload it',
        'Keep door openings short',
        'Place it in direct sunlight',
      ],
      correctIndex: 2,
      explanation: 'Frequent or long door openings waste cooling energy.',
    ),
    Question(
      question: 'What happens when multiple heavy appliances run together?',
      options: [
        'Electricity becomes cheaper',
        'Voltage drop and higher bills',
        'Power becomes faster',
        'Wires cool down',
      ],
      correctIndex: 1,
      explanation:
          'Large loads at once increase consumption and may damage wiring.',
    ),
    Question(
      question: 'Which behaviour saves the most energy?',
      options: [
        'Running AC at 18°C',
        'Using fans instead of AC when possible',
        'Leaving TV on standby',
        'Using an old freezer',
      ],
      correctIndex: 1,
      explanation:
          'Fans consume about 20x less energy than air conditioners.',
    ),
    Question(
      question: 'Why should appliances be cleaned and maintained?',
      options: [
        'They look shiny',
        'Clean appliances run more efficiently',
        'They consume more power',
        'They become heavier',
      ],
      correctIndex: 1,
      explanation:
          'Dust and dirt reduce the efficiency of appliances like fridges and ACs.',
    ),
    Question(
      question: 'What should you do before leaving home for long hours?',
      options: [
        'Leave appliances running',
        'Turn off unnecessary switches',
        'Lower AC temperature',
        'Keep geyser on',
      ],
      correctIndex: 1,
      explanation: 'Switching off appliances prevents energy waste and hazards.',
    ),
  ],

  // ------------------------------------------------------------------

  'Cyclone Tips': [
    Question(
      question: 'Before a cyclone warning Class II or III, what should you do?',
      options: [
        'Leave windows open',
        'Charge your phone and power banks fully',
        'Walk outside in high winds',
        'Ignore the warnings',
      ],
      correctIndex: 1,
      explanation:
          'Charged devices help maintain communication during outages.',
    ),
    Question(
      question: 'How should you store water before a cyclone?',
      options: [
        'Do not store water',
        'Store clean water in sealed bottles',
        'Leave buckets open outside',
        'Freeze all water',
      ],
      correctIndex: 1,
      explanation:
          'Water supply may be disrupted. Store sealed drinking water.',
    ),
    Question(
      question: 'What must be secured outside your home before a cyclone?',
      options: [
        'Furniture, pots, loose objects',
        'Closed windows',
        'Indoor carpets',
        'Ceiling fans',
      ],
      correctIndex: 0,
      explanation:
          'Loose objects can become dangerous projectiles during strong winds.',
    ),
    Question(
      question: 'What should you avoid doing during cyclone landfall?',
      options: [
        'Stay indoors and follow the news',
        'Walk or drive in flood waters',
        'Listen to Radio Mauritius updates',
        'Keep emergency lights nearby',
      ],
      correctIndex: 1,
      explanation:
          'Flood waters hide hazards like open drains, currents and electrical risks.',
    ),
    Question(
      question: 'In Mauritius, which organisation issues official cyclone bulletins?',
      options: [
        'CEB',
        'MBC',
        'Mauritius Meteorological Services',
        'Air Mauritius',
      ],
      correctIndex: 2,
      explanation:
          'Only MMS issues official cyclone warnings and classifications.',
    ),
    Question(
      question: 'What should you do when a cyclone Class IV is declared?',
      options: [
        'Go to the beach to film waves',
        'Stay indoors until the all-clear signal',
        'Go shopping',
        'Drive across rivers',
      ],
      correctIndex: 1,
      explanation: 'Class IV means cyclone conditions are present — stay inside.',
    ),
    Question(
      question: 'What lighting source is safest during a cyclone?',
      options: [
        'Candles',
        'Kerosene lamps',
        'Battery-powered or solar lamps',
        'Open fire',
      ],
      correctIndex: 2,
      explanation:
          'Battery-powered lights reduce fire hazards indoors.',
    ),
    Question(
      question: 'What should you do if a window cracks during a cyclone?',
      options: [
        'Tape and reinforce it from the inside',
        'Open it wider',
        'Push against it',
        'Ignore it',
      ],
      correctIndex: 0,
      explanation:
          'Tape helps prevent collapse and reduces glass shattering.',
    ),
    Question(
      question: 'What should you avoid doing outside immediately after a cyclone?',
      options: [
        'Checking roof damage',
        'Going near fallen power lines',
        'Cleaning debris',
        'Calling relatives',
      ],
      correctIndex: 1,
      explanation:
          'Fallen lines may still be live and extremely dangerous.',
    ),
    Question(
      question: 'What is the safest action during the calm “eye” of a cyclone?',
      options: [
        'Go outside to check damage',
        'Stay indoors — winds will return suddenly',
        'Fly a drone',
        'Drive to a friend’s house',
      ],
      correctIndex: 1,
      explanation:
          'The eye is temporary calm — dangerous winds return rapidly.',
    ),
  ],
};
