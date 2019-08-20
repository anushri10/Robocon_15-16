function [alpharad]=anglevec(veca, vecb)
alpharad=acos(dot(veca,vecb)/sqrt(dot(veca,veca)*dot(vecb,vecb)));
end