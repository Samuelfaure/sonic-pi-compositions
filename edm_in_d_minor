use_bpm 120

t = 0.8

live_loop :kick do
  sample :bd_haus, amp: 4
  sleep 0.8
end

live_loop :snare do
  sync :kick
  sample :sn_generic
  sleep 1.2
end

with_fx :reverb, mix: 0.7 do
  live_loop :synth do
    sync :kick
    use_synth :pluck
    play chord(:D3, :minor).choose, amp: 4, release: 1.5
    sleep [t * 2, t, t / 2, t / 2, t / 4, t / 4, t / 4].choose
  end
end

live_loop :bassdrum do
  sync :kick
  sample :bass_woodsy_c
  sleep t
  sample :bass_woodsy_c, rate: 1.5
  sleep t * 2
  sample :bass_woodsy_c, rate: 1.8
  sleep t
  sample :bass_woodsy_c, rate: 1.5
  sleep 2
end

live_loop :chords do
  sync :kick
  use_synth :dsaw
  [1, 3, 6, 4].each do |d|
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :d, :minor, 3, invert: i), amp: 1, release: 1.5
      sleep t
    end
  end
end
