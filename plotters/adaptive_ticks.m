function OUT = adaptive_ticks(IN, options)
%{
Makes nice tick marks for colourbars
INPUTS
IN -------- Picture/frame for which you want a colourbar
numticks -- Number of tick marks you want
percent --- The range between you want your top and bottom ticks
roundo ---- What to round to, you have to sort out the exponents if you
want (hint: Ruler.Exponents = 2)
zero ------ If you want to have a tick at zero, overwrites numticks if it's
even
short ----- Tucks in the top and bottom ticks by 2*roundo, just to make it
a touch cleaner, this is the most janky, use with caution
%}
arguments
    IN (:,:) double
    options.numticks (1, 1) single {mustBeInteger} = 5
    options.percent (2, 1) double {mustBeInRange(options.percent, 0, 100), mustBeDifferent(options.percent)} = [5, 95]
    options.roundo (1, 1) double = 1
    options.zero logical = 0
    options.short logical = 0
end

input = options;
topnbottom = prctile(IN(:), [input.percent(1), input.percent(2)], 'all');

ticks = linspace(topnbottom(1), topnbottom(2), input.numticks);
tickFin = roundto(ticks, input.roundo);

if input.zero == 1
    if isOdd(input.numticks) == 1
        tickFin(ceil(end/2)) = 0;
    else
        I = find(tickFin == tickFin(ceil(end/2)));
        tickFin = [tickFin(1:I), 0, tickFin(I+1:end)];
    end
end

if input.short == 1
    tickFin(1) = tickFin(1) + 2*input.roundo;
    tickFin(end) = tickFin(end) - 2*input.roundo;
end

OUT = tickFin;

end

function mustBeDifferent(in)
     if ismember(in(1), in(2))
        eidType = 'mustBeDifferent:notDifferent';
        msgType = 'Percentiles must be different from one another';
        throwAsCaller(MException(eidType,msgType))
     end
end