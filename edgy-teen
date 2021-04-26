use_bpm 160

live_loop :kick do
  sample :bd_zum
  sleep 1
end

use_random_seed 25
with_fx :compressor do
  with_fx :reverb do
    with_fx :ixi_techno, mix: 0.30, amp: 0.7 do
      live_loop :melody do
        randy = dice(10)
        puts randy
        if randy > 6
          use_synth :prophet
          scaly = scale(:b2, :major_pentatonic)
          n = 4
        else
          use_synth :chiplead
          scaly = scale(:b2, :minor_pentatonic)
          n = 8
        end
        
        n.times do
          t = [0.5, 0.5, 0.5, 0.5, 1, 1, 1.5, 2].choose
          play scaly.choose, sustain: t, release: t, amp: 1
          sleep t
        end
      end
    end
  end
end
