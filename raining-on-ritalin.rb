# Need external sample pack

bpm = 120.to_s
use_bpm bpm.to_i

live_loop :atmos do
  play_sample_timed atmos, bpm, 0
end

live_loop :beat do
  play_sample_timed beats, bpm, 0
end

live_loop :hihat do
  play_sample_timed beats, "OldHats", 0, amp: 0.5
end

live_loop :chords do
  play_sample_timed chords, bpm, 1, amp: 1.5
end

live_loop :paf do
  with_fx :reverb do
    sync :atmos, delay: 1
    
    sample fx, 4, amp: 0.5
    sleep 2
    
    sample fx, 4, amp: 0.5, rate: -2
    sleep 2
  end
end

live_loop :lead do
  sample melodies, bpm, "F", 0, amp: 0.3
  sleep 8
  sample melodies, bpm, "Em", 0, amp: 1.2, rate: 0.9
  sleep 8
end
