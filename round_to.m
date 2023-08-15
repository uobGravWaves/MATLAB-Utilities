function out = round_to(IN, val)
%Round IN to the nearest val
rindy = 1/val;
out = round(IN * rindy)/rindy;
end