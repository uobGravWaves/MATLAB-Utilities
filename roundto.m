function out = roundto(IN, val)

rindy = 1/val;
out = round(IN * rindy)/rindy;
end