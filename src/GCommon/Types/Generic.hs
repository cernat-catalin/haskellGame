{-# LANGUAGE DeriveGeneric #-}

module GCommon.Types.Generic (
  ClientKey,
  HostName,
  Port,
  PlayerSettings(..),
  PlayerSettingsReset(..),
  ConnHandle(..),
  Direction(..)
  ) where

import Data.Serialize (Serialize)
import GHC.Generics (Generic)
import Network.Socket (Socket, SockAddr(..))


type ClientKey  = Int
type HostName   = String
type Port       = String


data PlayerSettings = PlayerSettings {
  name      :: String,
  team      :: Int,
  vehicleId :: Int
} deriving (Show, Generic, Eq)

data PlayerSettingsReset = PlayerSettingsReset {
  rTeam :: Int,
  rVehicleId :: Int
} deriving (Show, Generic, Eq)

data ConnHandle = ConnHandle {
  connSocket :: Socket,
  connAddr   :: SockAddr
} deriving (Show)

data Direction = DUp | DRight | DDown | DLeft

instance Serialize PlayerSettings
instance Serialize PlayerSettingsReset
