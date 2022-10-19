use_bpm 115

live_loop :kick do
  sample :drum_heavy_kick
  sleep 1
  sample :drum_heavy_kick
  sample :perc_snap
  sleep 1
  sample :sn_zome
  sleep 0.5
  sample :drum_heavy_kick
  sleep 0.50
end

with_fx :reverb, cathedral: 1 do
  live_loop :chords, delay: 12 do
    use_synth :dsaw
    sync :kick
    notes_low = (scale :d3, :minor_pentatonic, num_octaves: 1).take(4)
    2.times do
      play notes_low.choose, sustain: 4, amp: 0.3
      sleep 4
    end
    2.times do
      play notes_low.choose, sustain: 2, amp: 0.3
      sleep 2
    end
  end
end

with_fx :reverb, cathedral: 1 do
  live_loop :chords2, delay: 2 do
    use_synth :beep
    sync :kick
    [1, 3, 6, 5].each do |d|
      play_chord (chord_degree d, :d4, :minor, 3, invert: -1), sustain: 2, amp: 0.5
      sleep 2
    end
  end
end

with_fx :eq, low: 1 do
  live_loop :melody, delay: 16 do
    sync :kick
    use_synth :pluck
    notes = []
    rrand_i(3, 8).times do |i|
      notes[i] = scale(:d3, :minor_pentatonic).choose
    end
    play_pattern_timed notes, 0.5
    sleep 0.25
    with_fx :rlpf, cutoff: [70, 100, 130].choose do
      with_fx :reverb, room: 1 do
        sample :misc_crow
      end
    end
  end
end
