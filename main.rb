class Semver
    include Comparable
    attr_reader :major, :minor, :patch

    def initialize(major = 0, minor = 0, patch = 0)
        if validate(major) && validate(minor) && validate(patch) then
            @major = major
            @minor = minor
            @patch = patch
        else
            raise ArgumentError
        end
    end

    def validate(num)
        num.instance_of?(Integer) && num >= 0
    end
    
    def to_s
        "#{self.major}.#{self.minor}.#{self.patch}"
    end

    def <=>(other)
        major_comp = self.major <=> other.major
        if major_comp == 0 then
            minor_comp = self.minor <=> other.minor
            if minor_comp == 0 then
                return self.patch <=> other.patch
            end
            return minor_comp
        end
        return major_comp
    end
end