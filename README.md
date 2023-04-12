# A-Topography-Recognition-and-Prediction-System-for-Hybrid-Vehicles
## An Embedded system-based and IoT_Data Science-supported navigation system.

	###BACKGROUND INFO.
 
 
####	HYBRID/SEMI-ELECTRIC VEHICLES: A case study of The Volvo Concept Truck.
 
Hybrid vehicles are the industry's slow entry into fully electric vehicles towards self-driving/autonomous vehicles. They utilize both the traditional diesel engine and the modern electric motors to power them and thus cutting down fuel costs and emissions. This translates to huge profits in the transportation industry especially for logistics companies, and a less polluted environment thus the demand for such a technology. 
Volvo's Concept Truck boasts of fuel and emission reduction by up-to 30%, thanks to improved aerodynamics and leading edge driveline technology through its hybrid powertrain. A hybrid powertrain is the mechanism that switches the vehicle into the fuel or electric mode. Considering the topography of land, we have three categories: uphill, flat land and downhill. When the vehicle is travelling uphill, it is on fuel mode i.e. it is powered by the engine, and when travelling downhill on slopes steeper than 1.1° or when braking, it charges the batteries which will power the vehicle when it is travelling on a flat land or a low gradient for a distance of up-to 10 km. The fuel mode may extend to flat and downhill terrain given special conditions such as the low battery with the electric mode also coming in play in areas of restricted emissions such as cities. With that said, how does the vehicle switch between the two modes? The driver could do this with some fancy push buttons and with reliance on his foresight, literally, or knowledge of the road if any. Technology has proven, in many arenas, that we human beings are quite inefficient and we are best innovating, inventing, creating or breaking stuff. The Volvo concept truck utilizes GPS and roadmap data to get a glimpse of the current and upcoming terrain, a cloud based topography recognition system. This topography data is initially computed in the cloud and sent to the vehicle{IoT in play}, this received data alongside the expected driving speeds are used to inform the most efficient driving mode and when to charge or utilize the batteries.
 
Topographic data of the upcoming terrain is used by the vehicle to calculate the best kinematic driving for cruising an upcoming uphill topography. 
The evaluation saves up to 5% fuel and can be shared with other connected drivers for them too, to enjoy this benefit.
 
For more info.:  https://youtu.be/uV-54LlSbcw
 
###	MEET THE ACCELEROMETER.
 
This is a component that measures the acceleration of an object.
Accelerometers can be found standalone or inside a package such as an inertial measurement unit sensor.
The accelerometer measures the gravitational pull on an object, g. It is normally calibrated so that it ranges between units e.g. from -1 to 1 with 0 as the checkpoint.
 
Will all have seen a hinge or at-least check that door you used last. It has 2 flat panels joined with a rod.
Hold the hinge on its rod making sure the flaps don’t, well….flap. Take the bottom flap and open it slowly until it is at right angled with its initial position. We can argue that the flap moved from 0° to 90°. Do the same for the top flap and we can argue the flap moved from 0° to -90°.
 
Back to the accelerometer,  The accelerometer measures the gravitational pull, g in three axes; x, y and z.
When the accelerometer is lying flat, just as with hinge with its flaps at 0°, z = 1, y = 0 and x = 0. Let's focus on the y-axis today as the other axes values are so small thus insignificant in this scenario. When you lift it as you did with the upper flap, the y values will start changing gradually, 0.2, 0.3, 0.5, 0.758…. until the last value of y is 1 i.e. since sin-1(1) is 90°. As the accelerometer returns to its initial position i.e. towards 0°, the value of y moves from 1 towards 0.
If we were to lift the accelerometer in the other direction, just like the lower flap, the y values will move from 0 to -1. The negative sign here tells us the direction as gravitational pull is a vector i.e. has both magnitude and direction.
 
But just how do we calculate acceleration? 
 
The accelerometer measures acceleration thus the acceleration as a whole can be obtained by finding the magnitude of the acceleration; 
 
                                                         |A|= √(Ax^2+Ay^2+Az^2 ).
 
The gravitation acceleration is a Physics constant; 1g = 9.8 m/s2 thus acceleration is given by;
      
                                                            ∆g x g=m/s^2 .
 
At the same time, we can calculate velocity and distance from acceleration. Velocity is change in acceleration with time and distance is the change in velocity with time. We therefore integrate the acceleration until we have the distance.
 
Consider a constant acceleration and the initial conditions for velocity and displacement are 0 and the Total time taken is to move from point x to y is T.
 
                                                              a = const
                                                              v = ∫_0^T▒〖a . dt 〗 
                                                              s = ∫_0^T▒〖v . dt〗

###	REGRESSION; A STATISTICAL MODEL.
 
This is a Statistical model that relates two variables and is therefore used to predict one variable(s) given the other(s). They are dependent on each other.
 
The following are the steps ought to be followed in order to come up with a formulae to relate the two variables and thus use them to make a prediction given some values of one of the two variables involved.
 
      The values of the two different variables should be the same, let's them be, x and y.
      Find the sum of the x values.
      Find the sum of the y values.
      Find the sum of the multiplying x and y values which are of the same index e.g. take the first value of x and that of y multiply them         and add the result to the multiplication of the second value of x and that of y.
      Find the sum of squaring the values of x and adding the altogether.
      Find the means of x and y.
      We are seeking to find the regression of line of y on x of the form y = a + bx, that we will use to find y given some value of x; 
      We can find b from the formulae: [n ∑▒〖xy - ∑▒〖x∑▒〖y]〗〗〗  ÷[n ∑▒〖x^2  -( ∑▒〖x )^2]〗〗
      A is given by: 1/n [ ∑▒〖y -b〗 ∑▒〖x ] 〗
      Take any value for x best one value from the given values of x to get y. The value of y found should be equal to or close to the value          from the given dataset.
 
###	THE INNOVATION.
 
As there are many ways to dry fish, there are also many ways to well analyze topography. We present, just as Volvo recognizes topography using GPS and roadmap data, a topography recognition system that detects an uphill, flat land or downhill topography while measuring distance, using an accelerometer and a predictive statistical model.
 
The accelerometer measures the vehicle's angle with respect to a flat plane, to detect an uphill, downhill or flat topography, and distance covered by the vehicle. With the past and current accelerometer data, a predictive model predicts the upcoming topography i.e. will it be an uphill, flat or downhill topography and for what distance? When the vehicle covers the predicted distance, the model is fed the new data to improve its accuracy and the actual vs predicted parameters are plotted. As in the case of Volvo's Concept Truck's Technology, the past and current data, measured by the accelerometer alongside expected speed data, can be used to choose the most efficient driving mode while the predicted data can be used to calculate the best driving kinematics.
 
The data is aggregated and sent to the cloud after some time for storage and future data mining ventures. 
 
 



