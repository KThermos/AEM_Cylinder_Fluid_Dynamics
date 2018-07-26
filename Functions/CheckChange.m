function [ diff ] = CheckChange( list1, list2, tolerance )
%CHECKCHANGE Takes two lists of equal size and finds the differences
%between each element of each index. If any of these differences are
%greater than the tolerance, then the function will return 1.
%
%%% Returns 1 for different
%%% Returns 0 for same

num_items = size(list1,2);
diff = 0;

for i = 1:num_items
    item1 = list1(i);
    item2 = list2(i);
    if abs(item1-item2)>tolerance
        diff = diff+1;
    end
end

%This seems like an ugly way to do it, but ok.
if diff<1
    diff = 0;
else
    diff = 1;
end

end