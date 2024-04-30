using UnityEngine;

public class PauseMenu : MonoBehaviour
{

    public GameObject pauseMenu;
    private AudioManager audioManager;

    void Start()
    {

        Cursor.visible = false;
        audioManager = GameObject.FindGameObjectWithTag("Audio").GetComponent<AudioManager>();
    }

        
    

    void Update()
    {

        if (Input.GetKeyDown(KeyCode.Escape))
        {

            if (!pauseMenu.activeSelf)
            {

                Time.timeScale = 0f;
                pauseMenu.SetActive(true);
                Cursor.visible = true;
                audioManager.PauseBackgroundMusic();
                



            }
            else
            {


                Time.timeScale = 1f;
                pauseMenu.SetActive(false);
                Cursor.visible = false;
                audioManager.ResumeBackgroundMusic();
                

            }

        }

        
    }


    public void quit()
    {

        Application.Quit();

    }

    public void resume()
    {

        Time.timeScale = 1f;
        pauseMenu.SetActive(false);
        Cursor.visible = false;
        audioManager.ResumeBackgroundMusic();

    }
}
