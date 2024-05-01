using UnityEngine.SceneManagement;
using UnityEngine;

public class StartMenu : MonoBehaviour
{
    public GameObject startMenu;

    void Start()
    {
        Cursor.visible = true;
        startMenu.SetActive(true);
    }

    public void startGame()
    {
        SceneManager.LoadScene("level1");
    }

    public void quit()
    {
        Application.Quit();
    }
}
