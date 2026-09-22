# v1.5.3 Recording Freeze Fix

## Symptom
The application could stay open but stop repainting during recording, with the **Elapsed** timer appearing stuck around 10 seconds or later.

## Root causes addressed

1. The UI log drain used an unbounded `while` loop until the queue became completely empty. Under continuous event production, that callback could monopolize Tk's main event loop.
2. The recording timer repeatedly copied and rescanned the entire raw action list to calculate counts.
3. Recovery data was written to disk once for every recorded action.
4. Monitor metadata was repeatedly enumerated while recording.
5. Smart Target metadata was detected but was not copied into the final raw click action in the downloadable source build.

## New safeguards

- Log drain is capped at **250 entries per Tk callback**.
- Action counters are maintained incrementally.
- Recovery journal uses a background queue and batched writes.
- Monitor information is cached for the recording session in the downloadable build.
- Elapsed time uses `time.perf_counter()` and its callback reschedules itself even after a transient error.
- UI session history and the log queue are bounded.
- `hang_watchdog.log` records Python thread stacks if the UI heartbeat is stale for at least 5 seconds.

## Stress test

The v1.5.3 downloadable build was exercised under a virtual display for 18 seconds with heavy simulated recording/log traffic:

- 4,473 simulated actions
- Elapsed timer reached 00:18
- UI log queue remained responsive
- Watchdog did not report a stall

## If another freeze occurs

Open:

`Documents\Rice2k Macro Studio\Errors\hang_watchdog.log`

and also check:

- `error_log.txt`
- `launcher_log.txt`
- `startup_log.txt`

The watchdog file is designed to show what each Python thread was doing when the interface stopped responding.
