require "spec_helper"
require './main.rb'

describe "Semver" do
    before do
        @obj = Semver.new(1,2,3);
        @obj2 = Semver.new(1,3,4);
    end

    describe "オブジェクト生成のテスト" do
        it "オブジェクトからmajorを取得できる" do
            expect(@obj.major).to eq 1;
        end
        it "オブジェクトからminorを取得できる" do
            expect(@obj.minor).to eq 2;
        end
        it "オブジェクトからpatchを取得できる" do
            expect(@obj.patch).to eq 3;
        end
        it "初期化で負の数が与えられた時例外" do
            expect{Semver.new(-1,0,0)}.to raise_error ArgumentError;
        end
        it "初期化で小数が与えられた時例外" do
            expect{Semver.new(1.2,0,0)}.to raise_error ArgumentError;
        end
        it "初期化で文字列が与えられた時例外" do
            expect{Semver.new('a',0,0)}.to raise_error ArgumentError;
        end
    end

    describe "文字列変換のテスト" do
        it "major.minor.patchのフォーマットで文字列に変換する" do
            expect(@obj.to_s).to eq "1.2.3";
        end
    end

    describe "比較演算子のテスト" do
        context "まずmajorを比較する" do
            before do
                @bigger = Semver.new(2,2,3)
                @smaller = Semver.new(1,2,3)
            end
            it "==で比較できる" do
                expect(@smaller == @smaller).to eq true
            end
            it "> で比較できる" do
                expect(@bigger > @smaller).to eq true
            end
            it ">= で比較できる" do
                expect(@bigger >= @smaller).to eq true
            end
            it "< で比較できる" do
                expect(@bigger < @smaller).to eq false
            end
            it "<= で比較できる" do
                expect(@bigger <= @smaller).to eq false
            end
        end
        context "majorが同じときminorを比較する" do
            before do
                @bigger = Semver.new(1,4,3)
                @smaller = Semver.new(1,2,3)
            end
            it "==で比較できる" do
                expect(@smaller == @smaller).to eq true
            end
            it "> で比較できる" do
                expect(@bigger > @smaller).to eq true
            end
            it ">= で比較できる" do
                expect(@bigger >= @smaller).to eq true
            end
            it "< で比較できる" do
                expect(@bigger < @smaller).to eq false
            end
            it "<= で比較できる" do
                expect(@bigger <= @smaller).to eq false
            end       
        end
        context "major, minorが同じときpatchを比較する" do
            before do
                @bigger = Semver.new(1,2,4)
                @smaller = Semver.new(1,2,3)
            end
            it "==で比較できる" do
                expect(@smaller == @smaller).to eq true
            end
            it "> で比較できる" do
                expect(@bigger > @smaller).to eq true
            end
            it ">= で比較できる" do
                expect(@bigger >= @smaller).to eq true
            end
            it "< で比較できる" do
                expect(@bigger < @smaller).to eq false
            end
            it "<= で比較できる" do
                expect(@bigger <= @smaller).to eq false
            end 
        end
    end 
end
