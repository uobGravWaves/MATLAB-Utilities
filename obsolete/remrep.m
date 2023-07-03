function eep = remrep(array)

   o = 1;
    while o == 1
        t = size(array,1);
        array(end+1) = NaN;
        p = 1;
        try
            while isnan(array(p+1)) == false
            
                if array(p) == array(p+1)
                    array(p) = [];
                end
                p = p + 1;
            end
        end
        array(end) = [];
        r = size(array, 1);
        if t == r
            o = 0;
        end    
    end
    eep = array;
end