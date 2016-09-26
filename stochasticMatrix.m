function stochMat = stochasticMatrix(x, y, p)
a1s = p.a_1(1:p.noiseParm)' * x;
a2s = repmat(p.a_2(1:p.noiseParm), [length(x),1]);
a3s = p.a_1((p.noiseParm+1):(p.noiseParm*2))' * y;
a4s = repmat(p.a_2((p.noiseParm+1):(p.noiseParm*2)), [length(y),1]);
stochMat = sum(repmat(p.a_3(1:p.noiseParm),[length(y),1])'.*sin(a1s + a2s'),1) + sum(repmat(p.a_3((p.noiseParm+1):(p.noiseParm*2)),[length(y),1])'.*sin(a3s + a4s'),1);
stochMat = stochMat + p.offset;