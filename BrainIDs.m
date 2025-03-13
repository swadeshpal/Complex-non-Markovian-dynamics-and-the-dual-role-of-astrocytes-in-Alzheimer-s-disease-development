function [ID,Num] = BrainIDs(SNT,BrainID,N_node) 

    for j=1:length(BrainID)
        Num(j)=0;
        for k=1:N_node
            if SNT(k,1) == BrainID(1,j)
                Num(j)=Num(j)+1;
                ID(j,Num(j))=k;
            end
        end
    end
    
end
