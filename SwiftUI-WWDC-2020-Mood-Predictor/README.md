> *Note: I will upload screnshots when I can, however there appears to be a bug on Big Sur that prevents the playground from running.*
 
 # WWDC 2020: Mood Predictor, by Jake Short
 
 This playground focuses on an important topic in our society: mental health. Learning about and managing your emotions is a vital step in ensuring good mental health. In this playground, you can use the mood predictor to type out a sentence, and an ML model, using **NaturalLanguage**, will detect what emotions you are feeling.
 
 ---
 ## Instructions
  1. Start with the Mood Recognizer to get a recommended activity.
  2. Next, you can explore all the available activities.
 ---
 
 Based on the results from the ML model, the playground will recommend you one of four activities:
 
 - `Breathe`. A short, 20 second guided breathing activity. Focusing on breathing can help calm down when feeling stress.
 - `Relax`. A calming song plays for 20 seconds. Music can help with relaxing in stressful situations, and can allow you to relax when you have been working hard.
 - `Uplift`. This activity reads motivational quotes to lift your spirits and get you motivated.
 - `Stretch`. A stretching exercise which can help calm down when feeling upset or overwhelming emotions.
 
 ---
 
 
 ## Sources
 - `MoodPredictorView`: Prompts user for input, then uses **NaturalLanguage** and **ML** to determine the emotion present in the input. Then, a recommended activity is given to the user.
 - `StartupSheet`: Displays a short description when the playground is run.
 - `BreatheExerciseView`: Displays the breathing exercise view. Uses **AVFoundation** for Speech Synthesis. Timers are used to control the growing and shrinking circle.
 - `RelaxExerciseView`: Plays a calming and relaxing song using **AVFoundation**. Timers are used to control the shrinking circle.
 - `UpliftExerciseView`: Reads motivational and uplifting quotes out loud using **AVFoundation** and Speech Synthesis.
 - `StretchExerciseView`: Guided stretching, using **AVFoundation** for Speech Synthesis.
 ---
 
 
 ## Resources
 - Song on "Relax" exercise is: "Dream Culture" Kevin MacLeod (incompetech.com) [CC](https://creativecommons.org/licenses/by/4.0/)
 
 - Illstrations on a variety of pages are courtesy of https://undraw.co
 
 - Image on stretch exercise is from pexels.com
