function AirDensity = airdensity(Pressure, Temperature)
%Calculates air density from pressure and temperature
%Works for arrays
Rd = 286.9; %Gas constant for dry air

AirDensity = Pressure .* 1e2  ./ (Rd .* Temperature);