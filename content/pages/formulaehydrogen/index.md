---
title: "Could Formula E cars run on hydrogen?"
date: "2021-03-01"
---

*Note: I did not research hydrogen-powered racing before writing this article; I wanted to use deductive reasoning and napkin math to satisfy my curiosity*

I was curious what Formula E would be like with a fuel cell instead of batteries, so I calculated the energy storage of various cars using different fuels just for giggles. 

## Energy storage of various vehicles

A 2nd generation Formula E car has a 54kWh battery. (I prefer kWh over MJ #sorrynotsorry)

A street-legal Honda Clarity FCEV holds 5.46kg of compressed hydrogen gas, or 214kWh:

$$5.46kg~H_2\cdot\frac{1000g}{1kg}\cdot\frac{1mol~H_2}{2.016g}\cdot\frac{285kJ}{1mol~H_2}\cdot\frac{1kWh}{3600kJ}\approx214kWh$$

A 2020 F1 car holds 105kg of premium gasoline, or 1,321kWh:

$$105kg~gasoline\cdot\frac{1L}{0.75kg}\cdot\frac{9.5kWh}{1L}\approx1,321kWh$$

{{< figure src="formulaecar.jpg" caption="2nd generation Formula E car [5]" >}}

## Efficiency and power output

Fuel cells are only 60% efficient according to the US Dept. of Energy [1], but that's still ~2.5x the usable amount of energy as a current Formula E car (ignoring the real battery's internal resistance, so the actual number is even better than 2.5x).

The Clarity's fuel cell outputs 100kW continuous, and only weighs 52kg. [2] It uses a 1.7kWh buffer battery to feed the motor, which is similar to the 1kWh supercapacitor F1 cars use for their MGU-K boost motor. Formula E cars use their 54kWh battery for a 45 minute race, so the average power is 72kW:

$$\bar{P}=\frac{54kWh}{0.75h}=72kW$$

The Clarity fuel cell's average power output should be sufficient for a race, but the Formula E car would probably need a larger supercapacitor to handle the 250kW bursts. Luckily, the 52kg fuel cell would be replacing a 250kg battery, so there should be plenty of room for a capacitor energy store. 

## Safety

{{< figure src="Honda_FCX_platform_rear_Honda_Collection_Hall.jpg" caption="Honda Clarity hydrogen tanks inside ladder frame [5]. Not much protection compared to a racecar!" >}}

Safety is a huge consideration with hydrogen fuel. F1 cars put their fuel tanks inside the monocoque ("safety cell"), behind the driver's seat. The system isn't foolproof; when Romain Grosjean crashed in 2020, his fuel system burst and there was a huge fire. Hydrogen could be a potential safety upgrade: Toyota shot their hydrogen tank with a .50 caliber round and it didn't explode. [4] A fuel cell electric vehicle doesn't have a hot exhaust to serve as an ignition source, and there isn't 105kg of gasoline ready to coat the driver in case of a tank failure; hydrogen is the lightest gas/element in the universe. One safety hazard is water production: a Honda Clarity outputs roughly 50L of water per tank of hydrogen, which would need to be dumped somewhere other than the racetrack.

## Conclusion

With some modification, the hydrogen power source from a normal Honda Clarity should be sufficient to power a Formula E car. The higher available energy could lead to faster, longer, and more exciting races, and street-legal spec powertrains would further the FIA's goal of using Formula E as a laboratory to develop more environmentally-friendly street cars. To be clear, I'm not [advocating](/pages/serieshybrids) for hydrogen as a replacement for battery electric vehicles or hybrids; this is just a thought experiment about electric racing. 

---

[1] https://www.energy.gov/sites/prod/files/2015/11/f27/fcto_fuel_cells_fact_sheet.pdf

[2] https://owners.honda.com/vehicles/information/2019/Clarity%20Fuel%20Cell/specs#mid^ZC4F8KGNW

[3] ["Honda FCX platform rear Honda Collection Hall"](https://commons.wikimedia.org/wiki/File:Honda_FCX_platform_rear_Honda_Collection_Hall.jpg) by [Morio](https://commons.wikimedia.org/wiki/User:Morio) is licensed under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/deed.en).

[4] https://www.youtube.com/watch?v=jVeagFmmwA0

[5] "Formula E Car" by Dave Hamster is licensed with CC BY 2.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/2.0/