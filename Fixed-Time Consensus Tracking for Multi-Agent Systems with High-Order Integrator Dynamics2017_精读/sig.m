function sig = sig(s,u)
    delta=0.01;
    kk=1/delta;
    if abs(s)>delta
        sats=sign(s);
    else
        sats=kk*s;
    end
    sig=sats*abs(s).^u;
end

