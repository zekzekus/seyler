import qualified Data.Text      as T
import           Protolude
import           System.Exit    (ExitCode (..), exitWith)
import           System.IO      (hGetContents)
import           System.Process (CreateProcess (..), StdStream (CreatePipe),
                                 createProcess, shell, waitForProcess)

import           Seyler

main :: IO ()
main = do
    let cmd = Command Add [("title", "thisis myfirst")]
    _ <- runCommand $ toCommand cmd
    putStrLn ("Done!" :: Text)

runCommand :: Text -> IO [Text]
runCommand cmd = do
    (_, Just stdOut, _, ph) <-
        createProcess (shell (T.unpack cmd)) {std_out = CreatePipe}
    exit <- waitForProcess ph
    case exit of
        ExitSuccess -> T.splitOn ("\n" :: Text) . T.pack <$> hGetContents stdOut
        ExitFailure code -> exitWith (ExitFailure code)
