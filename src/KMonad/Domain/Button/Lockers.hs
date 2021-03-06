module KMonad.Domain.Button.Lockers
  ( mkLockOn
  , mkLockOnM
  , mkLockOff
  , mkLockOffM
  , mkLockToggle
  , mkLockToggleM
  )
where

import KMonad.Core
import KMonad.Domain.Effect

-- | Return a button that turns a lock On
mkLockOn :: (MonadLock m)
  => LockKey
  -> Button m
mkLockOn lk = mkButton $ \case
  BPress   -> lockOn lk
  BRelease -> pure ()

-- | Return a button that turns a lock On
mkLockOnM :: (MonadLock m, Monad n)
  => LockKey
  -> n (Button m)
mkLockOnM = pure . mkLockOn

-- | Return a button that turns a lock Off
mkLockOff :: (MonadLock m)
  => LockKey
  -> Button m
mkLockOff lk = mkButton $ \case
  BPress   -> lockOff lk
  BRelease -> pure ()

-- | Return a button that turns a lock Off
mkLockOffM :: (MonadLock m, Monad n)
  => LockKey
  -> n (Button m)
mkLockOffM = pure . mkLockOff

-- | Return a button that toggles a lock
mkLockToggle :: (MonadLock m)
  => LockKey
  -> Button m
mkLockToggle lk = mkButton $ \case
  BPress   -> lockToggle lk
  BRelease -> pure ()

-- | Return a button that toggles a lock
mkLockToggleM :: (MonadLock m, Monad n)
  => LockKey
  -> n (Button m)
mkLockToggleM = pure . mkLockToggle
