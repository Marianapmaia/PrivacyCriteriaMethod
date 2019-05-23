module PrivacyCriteriaHelper
    def personal_size(array)
        return  maior(1,tamanho(@list_pi, "PRIVATE")) +  maior(1,tamanho(@list_pi, "PUBLIC")) +  maior(1,tamanho(@list_pi, "SEMI"))
    end
    
    def tamanho(array,const)
        i = 0
        array.each do |ele|
            if ele.tipo == const then
                i = i + 1
            end
        end
        return i
    end
    
    def maior(a,b)
        if a >= b then
            return a
        else
            return b
        end
    end
end
